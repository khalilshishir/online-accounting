package org.dao.oa

import java.text.SimpleDateFormat

class CoAMasterController {

    def index() {
        render(view:'create')
    }
    def save(){
        println(params)

        CoAMasterInfo coAMasterInfo = null


        if(params.hidCoAMasterId){
            //this code is only for edit data
            coAMasterInfo = CoAMasterInfo.get(params.hidCoAMasterId)
            coAMasterInfo.accountCode = params.accountCode
            coAMasterInfo.accountName = params.accountName
            def coaClass= CoAClassInfo.read(coAMasterInfo.coaClass.id)
            def coaGroup = CoAGroupInfo.read(coAMasterInfo.coaGroup.id)
            coAMasterInfo.balance = params.balance
            coAMasterInfo.accountStatus = params.accountStatus
            coAMasterInfo.isDebitable = params.isDebitable
            coAMasterInfo.isCreditable = params.isCreditable
            def project = Project.read(coAMasterInfo.project.id)

            coAMasterInfo.coaClass = coaClass
            coAMasterInfo.coaGroup = coaGroup

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
        } else {
            //this code for save the data
            coAMasterInfo = new CoAMasterInfo()
            coAMasterInfo.validate(params)
            coAMasterInfo.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coAMasterInfo.properties = params
        }
        coAMasterInfo.save()
        def coAMasterList = CoAMasterInfo.findAllWhere(isActive: true)
        render(view: 'list',model: [coAMasterInfo:coAMasterInfo, coAMasterList: coAMasterList])
    }

    def list() {
        def coAMasterList = CoAMasterInfo.findAllWhere(isActive: true)
        render(view: 'list', model: [coAMasterList: coAMasterList])
    }

    def delete(Long id) {
        CoAMasterInfo coAMasterInfo = CoAMasterInfo.read(id)
        if(coAMasterInfo){
            coAMasterInfo.isActive=false
            coAMasterInfo.save();
            redirect(action: 'list')
        }
    }

    def update(Long id) {
        CoAMasterInfo coAMasterInfo = CoAMasterInfo.read(id)
        def coAMasterList = CoAMasterInfo.findAllWhere(isActive: true)
        render(view: 'create', model: [accountCode: coAMasterInfo.accountCode, accountName: coAMasterInfo.accountName,
                balance : coAMasterInfo.balance,coaClass:coAMasterInfo.coaClass,
                coaGroup: coAMasterInfo.coaGroup,
                accountStatus : coAMasterInfo.accountStatus, isDebitable : coAMasterInfo.isDebitable,
                isCreditable : coAMasterInfo.isCreditable, coAMasterList :coAMasterList, hidCoAMasterId:coAMasterInfo.id])
    }

}
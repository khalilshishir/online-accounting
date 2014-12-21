package org.dao.oa

import java.text.SimpleDateFormat

class CoAMasterController {

    def index() {
        render(view:'create')
    }
    def save(){
        println(params)
        String message
        CoAMaster coaMaster = null


        if(params.hidCoAMasterId){
            //this code is only for edit data
            coaMaster = CoAMaster.get(params.hidCoAMasterId)
            coaMaster.accountCode = params.accountCode
            coaMaster.accountName = params.accountName
            CoAClass coaClass = CoAClass.read(params.coaClass)
            CoAGroup coaGroup = CoAGroup.read(params.coaGroup)
            coaMaster.balance = params.balance
            coaMaster.accountStatus = params.accountStatus
            coaMaster.isDebitable = params.isDebitable
            coaMaster.isCreditable = params.isCreditable
            Project project = Project.read(params.project)

            coaMaster.coaClass = coaClass
            coaMaster.coaGroup = coaGroup
            coaMaster.project = project

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            coaMaster.updatedAt = updatedAt
            message="updated Successfully"
        } else {
            //this code for save the data
            coaMaster = new CoAMaster()
            coaMaster.validate(params)
            coaMaster.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coaMaster.properties = params
            message="Save Successfully"
        }
        coaMaster.save()
        def coaMasterList = CoAMaster.findAllWhere(isActive: true)
        flash.message=message
        render(view: 'list',model: [coaMaster:coaMaster, coaMasterList: coaMasterList])
    }

    def list() {
        def coaMasterList = CoAMaster.findAllWhere(isActive: true)
        render(view: 'list', model: [coaMasterList: coaMasterList])
    }

    def delete(Long id) {
        CoAMaster coaMaster = CoAMaster.read(id)
        if(coaMaster){
            coaMaster.isActive=false
            coaMaster.save();
            redirect(action: 'list')
        }
    }

    def update(Long id) {
        CoAMaster coaMaster = CoAMaster.read(id)
        def coaMasterList = CoAMaster.findAllWhere(isActive: true)
        render(view: 'create', model: [coaMaster: coaMaster, coaMasterList :coaMasterList, hidCoAMasterId:coaMaster.id])
    }

}
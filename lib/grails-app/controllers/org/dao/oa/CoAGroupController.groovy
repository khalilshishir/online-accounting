package org.dao.oa

import java.text.SimpleDateFormat

class CoAGroupController {

    def index() {
        redirect(action: 'list')
    }

    def save(){
        println(params)
        String message
        CoAGroup coAGroupInfo = null
        if(params.hidCoAGroupId){
            coAGroupInfo = CoAGroup.get(params.hidCoAGroupId)
            CoAClass coaClass = CoAClass.read(params.coAClass)
            coAGroupInfo.coAGroupName = params.coAGroupName
            coAGroupInfo.coAClass = coaClass

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            coAGroupInfo.updatedAt = updatedAt
            message="updated Successfully"
        } else {
            coAGroupInfo = new CoAGroup()
            coAGroupInfo.validate(params)
            coAGroupInfo.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coAGroupInfo.properties = params
            message="Save Successfully"
        }
        coAGroupInfo.save()
        def coAGroupList = CoAGroup.findAllWhere(isActive: true)
        flash.message=message
        render (view: 'index',model: [coAGroupInfo:coAGroupInfo, coAGroupList: coAGroupList])
    }

    def list() {
        def coAGroupList = CoAGroup.findAllWhere(isActive: true)
        render(view: 'index', model: [coAGroupList: coAGroupList])
    }

    def update(Long id) {
        CoAGroup coAGroupInfo = CoAGroup.read(id)
        def coAGroupList = CoAGroup.findAllWhere(isActive: true)
        render(view: 'index', model: [coAGroupInfo:coAGroupInfo,
                coAGroupList :coAGroupList, hidCoAGroupId:coAGroupInfo.id])
    }

    def delete(Long id) {
        CoAGroup coAGroupInfo = CoAGroup.read(id)
        if(coAGroupInfo){
            coAGroupInfo.isActive=false
            coAGroupInfo.save();
            redirect(action: 'list')
        }
    }

}

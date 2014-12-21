package org.dao.oa

import java.text.SimpleDateFormat

class CoAGroupController {

    def index() {
        redirect(action: 'list')
    }

    def save(){
        println(params)
        String message
        CoAGroupInfo coAGroupInfo = null
        if(params.hidCoAGroupId){
            coAGroupInfo = CoAGroupInfo.get(params.hidCoAGroupId)
            CoAClassInfo coaClass = CoAClassInfo.read(params.coAClass)
            coAGroupInfo.coAGroupName = params.coAGroupName
            coAGroupInfo.coAClass = coaClass

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            coAGroupInfo.updatedAt=updatedAt
            message="updated Successfully"
        } else {
            coAGroupInfo = new CoAGroupInfo()
            coAGroupInfo.validate(params)
            coAGroupInfo.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coAGroupInfo.properties = params
            message="Save Successfully"
        }
        coAGroupInfo.save()
        def coAGroupList = CoAGroupInfo.findAllWhere(isActive: true)
        flash.message=message
        render (view: 'index',model: [coAGroupInfo:coAGroupInfo, coAGroupList: coAGroupList])
    }

    def list() {
        def coAGroupList = CoAGroupInfo.findAllWhere(isActive: true)
        render(view: 'index', model: [coAGroupList: coAGroupList])
    }

    def update(Long id) {
        CoAGroupInfo coAGroupInfo = CoAGroupInfo.read(id)
        def coAGroupList = CoAGroupInfo.findAllWhere(isActive: true)
        render(view: 'index', model: [coAGroupInfo:coAGroupInfo,
                coAGroupList :coAGroupList, hidCoAGroupId:coAGroupInfo.id])
    }

    def delete(Long id) {
        CoAGroupInfo coAGroupInfo = CoAGroupInfo.read(id)
        if(coAGroupInfo){
            coAGroupInfo.isActive=false
            coAGroupInfo.save();
            redirect(action: 'list')
        }
    }

}

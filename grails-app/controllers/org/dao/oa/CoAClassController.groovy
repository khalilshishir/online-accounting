package org.dao.oa

import java.text.SimpleDateFormat

class CoAClassController {

    def index() {
        redirect(action: 'list')
    }
    def save(){
        println(params)

        CoAClassInfo coAClassInfo = null
        if(params.hidCoAClassId){
            //this code is only for edit data
            coAClassInfo = CoAClassInfo.get(params.hidCoAClassId)
            coAClassInfo.coAClassName = params.coAClassName
            coAClassInfo.coAClassType = params.coAClassType
            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            } else {
            //this code for save the data
            coAClassInfo = new CoAClassInfo()
            coAClassInfo.validate(params)
            coAClassInfo.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coAClassInfo.properties = params
        }
        coAClassInfo.save()
        def coAClassList = CoAClassInfo.findAllWhere(isActive: true)
        render(view: 'create',model: [coAClassInfo:coAClassInfo, coAClassList: coAClassList])
    }

    def list() {
        def coAClassList = CoAClassInfo.findAllWhere(isActive: true)
        render(view: 'create', model: [coAClassList: coAClassList])
    }

    def delete(Long id) {
        CoAClassInfo coAClassInfo = CoAClassInfo.read(id)
        if(coAClassInfo){

            coAClassInfo.isActive=false
            coAClassInfo.save();
            redirect(action: 'list')
        }
    }

    def update(Long id) {
        CoAClassInfo coAClassInfo = CoAClassInfo.read(id)
        def coAClassList = CoAClassInfo.findAllWhere(isActive: true)
        render(view: 'create', model: [coAClassName: coAClassInfo.coAClassName, coAClassType: coAClassInfo.coAClassType,
                coAClassList :coAClassList, hidCoAClassId:coAClassInfo.id])
    }
}
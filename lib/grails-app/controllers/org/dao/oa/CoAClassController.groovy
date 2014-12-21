package org.dao.oa

import java.text.SimpleDateFormat

class CoAClassController {

    def index() {
        redirect(action: 'list')
    }
    def save(){
        println(params)
        String message

        CoAClass coaClass = null
        if(params.hidCoAClassId){
            //this code is only for edit data
            coaClass = CoAClass.get(params.hidCoAClassId)
            coaClass.coAClassName = params.coAClassName
            coaClass.coAClassType = params.coAClassType

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            coaClass.updatedAt = updatedAt
            message="updated Successfully"
            } else {
            //this code for save the data
            coaClass = new CoAClass()
            coaClass.validate(params)
            coaClass.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            coaClass.properties = params
            message="Save Successfully"
        }
        coaClass.save()
        def coAClassList = CoAClass.findAllWhere(isActive: true)
        flash.message=message
        render(view: 'create',model: [coaClass:coaClass, coAClassList: coAClassList])
    }

    def list() {
        def coAClassList = CoAClass.findAllWhere(isActive: true)
        render(view: 'create', model: [coAClassList: coAClassList])
    }

    def delete(Long id) {
        CoAClass coaClass = CoAClass.read(id)
        if(coaClass){

            coaClass.isActive=false
            coaClass.save();
            redirect(action: 'list')
        }
    }

    def update(Long id) {
        CoAClass coaClass = CoAClass.read(id)
        def coAClassList = CoAClass.findAllWhere(isActive: true)
        render(view: 'create', model: [coAClassName: coaClass.coAClassName, coAClassType: coaClass.coAClassType,
                coAClassList :coAClassList, hidCoAClassId:coaClass.id])
    }
}
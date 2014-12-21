package org.dao.oa.test

class VehicleController {
    def create(){

    }
    def manufacturerSelected(){
        def manufacturer = Manufacturer.findById(params.id)
        render g.select(optionKey: 'id', optionValue: 'modelName', from: manufacturer.models, id: 'model', name: "model")
    }
}


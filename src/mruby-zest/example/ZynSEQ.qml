Group {
    id: box
    label: "SEQ"
    extern: ""
    copyable: true

    
    Widget {
        function layout(l, selfBox) {
            Draw::Layout::hpack(l, selfBox, children)
        }

        Col {
            ParModuleRow {
                id: top
                Knob { id: freq; type: :float; extern: box.extern+"freq" }
                Knob { type: :float; extern: box.extern+"intensity" }
                
            }
            ParModuleRow {
                id: bot
                Knob { type: :float; extern: box.extern+"delay"}
                        Col {
            
            ToggleButton   { label: "sync"; extern: box.extern+"continous"}
            
            NumEntry {
                id: numerator
                extern: box.extern + "numerator"; 
                label: "Numerator"
                whenValue: lambda {
                    freq.active = true if numerator.value == 0
                    freq.active = false if numerator.value != 0
                    box.damage_self
                }
            }
            NumEntry {extern: box.extern + "denominator"; label: "Denominator"}
        }
                
                }
        }

    }
}

    //
    //  AutenticationLoginModel.swift
    //  ProjectFinal
    //
    //  Created by Anderson Carlos Nunes Sales on 13/01/2019.
    //  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
    //

    import Foundation

    class AutenticarLoginModel {

            func efetuarLogin(_ usuario: String,_ senha: String) -> TipoUsuarioEnum {
                
                if usuario == "admin" && senha == "admin"{
                    return TipoUsuarioEnum.Admin
                }else if usuario == "view" && senha == "view"{
                    return TipoUsuarioEnum.View
                }
                return TipoUsuarioEnum.Invalid
            }

            func validarTipoUsuario(_ tipoUsuarioEnum: TipoUsuarioEnum) -> Bool {
                    switch tipoUsuarioEnum{
                case .Admin:
                    return true
                case .View:
                    return true
                case .Invalid:
                    return false
                }
            }

            func isAdmin(_ tipoUsuarioEnum: TipoUsuarioEnum) -> Bool{
                if tipoUsuarioEnum == TipoUsuarioEnum.Admin{
                    return true
                }
                return false
            }

    }

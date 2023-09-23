@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'y Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity yc_clientes
  as select from ycliente_log   as Clientes
    inner join   yclnts_lib_log as ClntLib on ClntLib.id_cliente = Clientes.id_cliente
{
  key ClntLib.id_libro                                          as IdLibro,
  key Clientes.id_cliente                                       as IdCliente,
  key Clientes.tipo_acceso                                      as Acceso,
      Clientes.nombre                                           as Nombre,
      Clientes.apellidos                                        as Apellidos,
      Clientes.email                                            as Email,
      Clientes.url                                              as Imagen,
      concat_with_space(Clientes.nombre, Clientes.apellidos, 1) as NombreCompleto
}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'y Clientes Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity yc_clnt_lib
  as select from yclnts_lib_log
{
  key id_libro                   as IdLibro,
      count(distinct id_cliente) as Ventas
}
group by
  id_libro;

{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.CSIPluginContainerInfo (CSIPluginContainerInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.CSIPluginContainerInfo.Service as Protos.CSIPluginContainerInfo (Service)
import qualified Mesos.Protos.CommandInfo as Protos (CommandInfo)
import qualified Mesos.Protos.ContainerInfo as Protos (ContainerInfo)
import qualified Mesos.Protos.Resource as Protos (Resource)

data CSIPluginContainerInfo = CSIPluginContainerInfo{services :: !(P'.Seq Protos.CSIPluginContainerInfo.Service),
                                                     command :: !(P'.Maybe Protos.CommandInfo),
                                                     resources :: !(P'.Seq Protos.Resource),
                                                     container :: !(P'.Maybe Protos.ContainerInfo)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                        Prelude'.Generic)

instance P'.Mergeable CSIPluginContainerInfo where
  mergeAppend (CSIPluginContainerInfo x'1 x'2 x'3 x'4) (CSIPluginContainerInfo y'1 y'2 y'3 y'4)
   = CSIPluginContainerInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default CSIPluginContainerInfo where
  defaultValue = CSIPluginContainerInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire CSIPluginContainerInfo where
  wireSize ft' self'@(CSIPluginContainerInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(CSIPluginContainerInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutRepWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{services = P'.append (services old'Self) new'Field}) (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{services = P'.mergeAppend (services old'Self) new'Field})
                    (P'.wireGetPacked 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{command = P'.mergeAppend (command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{resources = P'.append (resources old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{container = P'.mergeAppend (container old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CSIPluginContainerInfo) CSIPluginContainerInfo where
  getVal m' f' = f' m'

instance P'.GPB CSIPluginContainerInfo

instance P'.ReflectDescriptor CSIPluginContainerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.CSIPluginContainerInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"CSIPluginContainerInfo\"}, descFilePath = [\"Mesos\",\"Protos\",\"CSIPluginContainerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.CSIPluginContainerInfo.services\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"services\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Just (WireTag {getWireTag = 8},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.CSIPluginContainerInfo.Service\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName = MName \"Service\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.CSIPluginContainerInfo.command\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"command\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.CommandInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"CommandInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.CSIPluginContainerInfo.resources\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Resource\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.CSIPluginContainerInfo.container\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"container\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.ContainerInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType CSIPluginContainerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CSIPluginContainerInfo where
  textPut msg
   = do
       P'.tellT "services" (services msg)
       P'.tellT "command" (command msg)
       P'.tellT "resources" (resources msg)
       P'.tellT "container" (container msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'services, parse'command, parse'resources, parse'container]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'services
         = P'.try
            (do
               v <- P'.getT "services"
               Prelude'.return (\ o -> o{services = P'.append (services o) v}))
        parse'command
         = P'.try
            (do
               v <- P'.getT "command"
               Prelude'.return (\ o -> o{command = v}))
        parse'resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{resources = P'.append (resources o) v}))
        parse'container
         = P'.try
            (do
               v <- P'.getT "container"
               Prelude'.return (\ o -> o{container = v}))
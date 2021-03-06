{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Volume (Volume(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.Image as Protos (Image)
import qualified Mesos.Protos.Volume.Mode as Protos.Volume (Mode)
import qualified Mesos.Protos.Volume.Source as Protos.Volume (Source)

data Volume = Volume{mode :: !(Protos.Volume.Mode), container_path :: !(P'.Utf8), host_path :: !(P'.Maybe P'.Utf8),
                     image :: !(P'.Maybe Protos.Image), source :: !(P'.Maybe Protos.Volume.Source)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Volume where
  mergeAppend (Volume x'1 x'2 x'3 x'4 x'5) (Volume y'1 y'2 y'3 y'4 y'5)
   = Volume (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default Volume where
  defaultValue = Volume P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Volume where
  wireSize ft' self'@(Volume x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5)
  wirePutWithSize ft' self'@(Volume x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'2, P'.wirePutOptWithSize 18 9 x'3, P'.wirePutReqWithSize 24 14 x'1,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5]
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
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{mode = new'Field}) (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{container_path = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{host_path = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{image = P'.mergeAppend (image old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{source = P'.mergeAppend (source old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Volume) Volume where
  getVal m' f' = f' m'

instance P'.GPB Volume

instance P'.ReflectDescriptor Volume where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 24]) (P'.fromDistinctAscList [10, 18, 24, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Volume\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Volume\"}, descFilePath = [\"Mesos\",\"Protos\",\"Volume.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Volume.mode\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"mode\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Volume.Mode\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Volume\"], baseName = MName \"Mode\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Volume.container_path\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"container_path\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Volume.host_path\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"host_path\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Volume.image\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"image\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Image\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"Image\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Volume.source\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"source\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.Volume.Source\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Volume\"], baseName = MName \"Source\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Volume where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Volume where
  textPut msg
   = do
       P'.tellT "mode" (mode msg)
       P'.tellT "container_path" (container_path msg)
       P'.tellT "host_path" (host_path msg)
       P'.tellT "image" (image msg)
       P'.tellT "source" (source msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'mode, parse'container_path, parse'host_path, parse'image, parse'source]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'mode
         = P'.try
            (do
               v <- P'.getT "mode"
               Prelude'.return (\ o -> o{mode = v}))
        parse'container_path
         = P'.try
            (do
               v <- P'.getT "container_path"
               Prelude'.return (\ o -> o{container_path = v}))
        parse'host_path
         = P'.try
            (do
               v <- P'.getT "host_path"
               Prelude'.return (\ o -> o{host_path = v}))
        parse'image
         = P'.try
            (do
               v <- P'.getT "image"
               Prelude'.return (\ o -> o{image = v}))
        parse'source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{source = v}))
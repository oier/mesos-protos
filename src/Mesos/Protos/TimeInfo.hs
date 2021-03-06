{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.TimeInfo (TimeInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data TimeInfo = TimeInfo{nanoseconds :: !(P'.Int64)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TimeInfo where
  mergeAppend (TimeInfo x'1) (TimeInfo y'1) = TimeInfo (P'.mergeAppend x'1 y'1)

instance P'.Default TimeInfo where
  defaultValue = TimeInfo P'.defaultValue

instance P'.Wire TimeInfo where
  wireSize ft' self'@(TimeInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 3 x'1)
  wirePutWithSize ft' self'@(TimeInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 3 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{nanoseconds = new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TimeInfo) TimeInfo where
  getVal m' f' = f' m'

instance P'.GPB TimeInfo

instance P'.ReflectDescriptor TimeInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.TimeInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}, descFilePath = [\"Mesos\",\"Protos\",\"TimeInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.TimeInfo.nanoseconds\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"TimeInfo\"], baseName' = FName \"nanoseconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType TimeInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TimeInfo where
  textPut msg
   = do
       P'.tellT "nanoseconds" (nanoseconds msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'nanoseconds]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'nanoseconds
         = P'.try
            (do
               v <- P'.getT "nanoseconds"
               Prelude'.return (\ o -> o{nanoseconds = v}))
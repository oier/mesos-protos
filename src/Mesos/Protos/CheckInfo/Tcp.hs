{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.CheckInfo.Tcp (Tcp(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Tcp = Tcp{port :: !(P'.Word32)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Tcp where
  mergeAppend (Tcp x'1) (Tcp y'1) = Tcp (P'.mergeAppend x'1 y'1)

instance P'.Default Tcp where
  defaultValue = Tcp P'.defaultValue

instance P'.Wire Tcp where
  wireSize ft' self'@(Tcp x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 13 x'1)
  wirePutWithSize ft' self'@(Tcp x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 13 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{port = new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Tcp) Tcp where
  getVal m' f' = f' m'

instance P'.GPB Tcp

instance P'.ReflectDescriptor Tcp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.CheckInfo.Tcp\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"CheckInfo\"], baseName = MName \"Tcp\"}, descFilePath = [\"Mesos\",\"Protos\",\"CheckInfo\",\"Tcp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.CheckInfo.Tcp.port\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\",MName \"Tcp\"], baseName' = FName \"port\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Tcp where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Tcp where
  textPut msg
   = do
       P'.tellT "port" (port msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'port]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{port = v}))
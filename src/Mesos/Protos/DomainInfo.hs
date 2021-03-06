{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.DomainInfo (DomainInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.DomainInfo.FaultDomain as Protos.DomainInfo (FaultDomain)

data DomainInfo = DomainInfo{fault_domain :: !(P'.Maybe Protos.DomainInfo.FaultDomain)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable DomainInfo where
  mergeAppend (DomainInfo x'1) (DomainInfo y'1) = DomainInfo (P'.mergeAppend x'1 y'1)

instance P'.Default DomainInfo where
  defaultValue = DomainInfo P'.defaultValue

instance P'.Wire DomainInfo where
  wireSize ft' self'@(DomainInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1)
  wirePutWithSize ft' self'@(DomainInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{fault_domain = P'.mergeAppend (fault_domain old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DomainInfo) DomainInfo where
  getVal m' f' = f' m'

instance P'.GPB DomainInfo

instance P'.ReflectDescriptor DomainInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.DomainInfo\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"DomainInfo\"}, descFilePath = [\"Mesos\",\"Protos\",\"DomainInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.DomainInfo.fault_domain\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"DomainInfo\"], baseName' = FName \"fault_domain\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.DomainInfo.FaultDomain\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"DomainInfo\"], baseName = MName \"FaultDomain\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType DomainInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DomainInfo where
  textPut msg
   = do
       P'.tellT "fault_domain" (fault_domain msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'fault_domain]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'fault_domain
         = P'.try
            (do
               v <- P'.getT "fault_domain"
               Prelude'.return (\ o -> o{fault_domain = v}))
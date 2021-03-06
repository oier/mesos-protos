{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Call.Revive (Revive(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Revive = Revive{roles :: !(P'.Seq P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Revive where
  mergeAppend (Revive x'1) (Revive y'1) = Revive (P'.mergeAppend x'1 y'1)

instance P'.Default Revive where
  defaultValue = Revive P'.defaultValue

instance P'.Wire Revive where
  wireSize ft' self'@(Revive x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 9 x'1)
  wirePutWithSize ft' self'@(Revive x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 9 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{roles = P'.append (roles old'Self) new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Revive) Revive where
  getVal m' f' = f' m'

instance P'.GPB Revive

instance P'.ReflectDescriptor Revive where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.scheduler.Call.Revive\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Revive\"}, descFilePath = [\"Mesos\",\"Protos\",\"Call\",\"Revive.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Revive.roles\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Revive\"], baseName' = FName \"roles\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Revive where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Revive where
  textPut msg
   = do
       P'.tellT "roles" (roles msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'roles]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'roles
         = P'.try
            (do
               v <- P'.getT "roles"
               Prelude'.return (\ o -> o{roles = P'.append (roles o) v}))
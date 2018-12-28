{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Call.Kill (Kill(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.Protos.KillPolicy as Protos (KillPolicy)
import qualified Mesos.Protos.SlaveID as Protos (SlaveID)
import qualified Mesos.Protos.TaskID as Protos (TaskID)

data Kill = Kill{task_id :: !(Protos.TaskID), slave_id :: !(P'.Maybe Protos.SlaveID), kill_policy :: !(P'.Maybe Protos.KillPolicy)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Kill where
  mergeAppend (Kill x'1 x'2 x'3) (Kill y'1 y'2 y'3)
   = Kill (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Kill where
  defaultValue = Kill P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Kill where
  wireSize ft' self'@(Kill x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePutWithSize ft' self'@(Kill x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{task_id = P'.mergeAppend (task_id old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{slave_id = P'.mergeAppend (slave_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{kill_policy = P'.mergeAppend (kill_policy old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Kill) Kill where
  getVal m' f' = f' m'

instance P'.GPB Kill

instance P'.ReflectDescriptor Kill where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.scheduler.Call.Kill\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Kill\"}, descFilePath = [\"Mesos\",\"Protos\",\"Call\",\"Kill.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Kill.task_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Kill\"], baseName' = FName \"task_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.TaskID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Kill.slave_id\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Kill\"], baseName' = FName \"slave_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.SlaveID\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"SlaveID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.scheduler.Call.Kill.kill_policy\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Kill\"], baseName' = FName \"kill_policy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.KillPolicy\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\"], baseName = MName \"KillPolicy\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Kill where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Kill where
  textPut msg
   = do
       P'.tellT "task_id" (task_id msg)
       P'.tellT "slave_id" (slave_id msg)
       P'.tellT "kill_policy" (kill_policy msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'task_id, parse'slave_id, parse'kill_policy]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'task_id
         = P'.try
            (do
               v <- P'.getT "task_id"
               Prelude'.return (\ o -> o{task_id = v}))
        parse'slave_id
         = P'.try
            (do
               v <- P'.getT "slave_id"
               Prelude'.return (\ o -> o{slave_id = v}))
        parse'kill_policy
         = P'.try
            (do
               v <- P'.getT "kill_policy"
               Prelude'.return (\ o -> o{kill_policy = v}))
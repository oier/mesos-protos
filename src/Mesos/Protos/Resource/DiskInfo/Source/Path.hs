{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.Protos.Resource.DiskInfo.Source.Path (Path(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Path = Path{root :: !(P'.Maybe P'.Utf8)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Path where
  mergeAppend (Path x'1) (Path y'1) = Path (P'.mergeAppend x'1 y'1)

instance P'.Default Path where
  defaultValue = Path P'.defaultValue

instance P'.Wire Path where
  wireSize ft' self'@(Path x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1)
  wirePutWithSize ft' self'@(Path x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 9 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{root = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Path) Path where
  getVal m' f' = f' m'

instance P'.GPB Path

instance P'.ReflectDescriptor Path where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.Resource.DiskInfo.Source.Path\", haskellPrefix = [MName \"Mesos\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName = MName \"Path\"}, descFilePath = [\"Mesos\",\"Protos\",\"Resource\",\"DiskInfo\",\"Source\",\"Path.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.Resource.DiskInfo.Source.Path.root\", haskellPrefix' = [MName \"Mesos\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\",MName \"Path\"], baseName' = FName \"root\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Path where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Path where
  textPut msg
   = do
       P'.tellT "root" (root msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'root]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'root
         = P'.try
            (do
               v <- P'.getT "root"
               Prelude'.return (\ o -> o{root = v}))
-- file Spec.hs
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "1" $ do
    it "should be equal to itself" $ do
      1 `shouldBe` 1

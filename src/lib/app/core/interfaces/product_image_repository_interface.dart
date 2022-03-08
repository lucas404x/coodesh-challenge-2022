abstract class IProductImageRepository {
  Future<String> getDownloadUrl(String filename);
}
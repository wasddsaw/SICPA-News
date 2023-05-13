abstract class MostPopularRepository {
  Future mostViewed(int period);
  Future mostShared(int period);
  Future mostEmailed(int period);
  Future articleSearch(
      String beginDate,
      String endDate,
      String facet,
      String facetFields,
      String facetFilter,
      String f1,
      String fq,
      int page,
      String query,
      String sort);
}

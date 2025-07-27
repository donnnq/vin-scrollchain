contract vinConstitutionCodex {
    struct Article {
        uint8 articleId;
        string title;
        string clause;
        bool active;
    }

    Article[] public constitution;
    event ArticleAdded(uint8 id, string title);

    function addArticle(string calldata title, string calldata clause) external {
        uint8 newId = uint8(constitution.length + 1);
        constitution.push(Article(newId, title, clause, true));
        emit ArticleAdded(newId, title);
    }

    function toggleArticle(uint8 id, bool status) external {
        require(id <= constitution.length, "Invalid ID");
        constitution[id - 1].active = status;
    }
}

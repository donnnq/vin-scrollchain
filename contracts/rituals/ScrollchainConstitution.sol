// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollchainConstitution - Foundational covenant for scrollchain governance and civic rituals
/// @author Vinvin & Copilot
/// @notice Encodes sacred roles, rights, and rules for Temple Guardians and stewards

contract ScrollchainConstitution {
    address public founder;
    string public preamble;
    uint256 public articleCount;

    struct Article {
        string title;
        string clause;
        bool active;
    }

    mapping(uint256 => Article) public articles;
    uint256[] public articleIds;

    event ArticleAdded(uint256 indexed articleId, string title);
    event ArticleUpdated(uint256 indexed articleId, string clause);
    event ArticleDeactivated(uint256 indexed articleId);

    modifier onlyFounder() {
        require(msg.sender == founder, "Not authorized");
        _;
    }

    constructor(string memory _preamble) {
        founder = msg.sender;
        preamble = _preamble;
        articleCount = 0;
    }

    /// @notice Add a new constitutional article
    function addArticle(string memory title, string memory clause) external onlyFounder {
        articles[articleCount] = Article({
            title: title,
            clause: clause,
            active: true
        });

        articleIds.push(articleCount);
        emit ArticleAdded(articleCount, title);
        articleCount++;
    }

    /// @notice Update an existing article
    function updateArticle(uint256 articleId, string memory newClause) external onlyFounder {
        require(articles[articleId].active, "Article not active");
        articles[articleId].clause = newClause;
        emit ArticleUpdated(articleId, newClause);
    }

    /// @notice Deactivate an article
    function deactivateArticle(uint256 articleId) external onlyFounder {
        require(articles[articleId].active, "Already inactive");
        articles[articleId].active = false;
        emit ArticleDeactivated(articleId);
    }

    /// @notice View article details
    function getArticle(uint256 articleId) external view returns (Article memory) {
        require(articleId < articleCount, "Article does not exist");
        return articles[articleId];
    }

    /// @notice Total articles
    function totalArticles() external view returns (uint256) {
        return articleCount;
    }
}

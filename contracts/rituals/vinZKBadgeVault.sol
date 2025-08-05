pragma solidity ^0.8.0;

contract vinZKBadgeVault {
    struct Badge {
        string scrollName;
        bool isVerified;
        bytes zkProof;
    }

    mapping(string => Badge) public badges;

    event BadgeIssued(string scrollName, bool verified);

    function issueBadge(string memory _scrollName, bytes memory _zkProof) public {
        badges[_scrollName] = Badge(_scrollName, true, _zkProof);
        emit BadgeIssued(_scrollName, true);
    }

    function getBadge(string memory _scrollName) public view returns (Badge memory) {
        return badges[_scrollName];
    }
}

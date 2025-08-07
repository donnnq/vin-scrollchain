pragma solidity ^0.8.0;

contract vinCommunityBadgeOracle {
    struct CivicBadge {
        address recipient;
        string badgeTitle;
        string context;
        uint256 timestamp;
    }

    CivicBadge[] public badges;

    event BadgeGranted(address indexed recipient, string badgeTitle);

    function grantBadge(address _recipient, string memory _title, string memory _context) public {
        badges.push(CivicBadge({
            recipient: _recipient,
            badgeTitle: _title,
            context: _context,
            timestamp: block.timestamp
        }));

        emit BadgeGranted(_recipient, _title);
    }

    function getBadgesOf(address _recipient) public view returns (CivicBadge[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < badges.length; i++) {
            if (badges[i].recipient == _recipient) count++;
        }

        CivicBadge[] memory userBadges = new CivicBadge[](count);
        uint256 index = 0;

        for (uint256 i = 0; i < badges.length; i++) {
            if (badges[i].recipient == _recipient) {
                userBadges[index] = badges[i];
                index++;
            }
        }

        return userBadges;
    }

    function getAllBadges() public view returns (CivicBadge[] memory) {
        return badges;
    }
}

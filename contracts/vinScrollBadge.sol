// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollBadge {
    address public scrollsmith;
    uint public badgeCount;

    struct ScrollBadge {
        string badgeTitle;
        string recipientName;
        string skillTrack;
        string achievementLevel;
        bool verifiedBlessing;
        uint timestamp;
    }

    mapping(uint => ScrollBadge) public badgeRegistry;

    event BadgeMinted(string badgeTitle, string recipientName, string achievementLevel);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        badgeCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith can mint scroll badges.");
        _;
    }

    // 🪄 Mint a badge for a graduate
    function mintBadge(
        string memory badgeTitle,
        string memory recipientName,
        string memory skillTrack,
        string memory achievementLevel,
        bool verifiedBlessing
    ) public onlyScrollsmith {
        badgeRegistry[badgeCount++] = ScrollBadge(
            badgeTitle,
            recipientName,
            skillTrack,
            achievementLevel,
            verifiedBlessing,
            block.timestamp
        );

        emit BadgeMinted(badgeTitle, recipientName, achievementLevel);
    }

    // 🔍 View badge details
    function getBadge(uint id) public view returns (
        string memory badgeTitle,
        string memory recipientName,
        string memory skillTrack,
        string memory achievementLevel,
        bool verifiedBlessing,
        uint timestamp
    ) {
        ScrollBadge memory sb = badgeRegistry[id];
        return (
            sb.badgeTitle,
            sb.recipientName,
            sb.skillTrack,
            sb.achievementLevel,
            sb.verifiedBlessing,
            sb.timestamp
        );
    }

    // 🧙 Transfer scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 Metrics
    function totalBadges() public view returns (uint) {
        return badgeCount;
    }
}

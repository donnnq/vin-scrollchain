// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinRedemptionBadgeMint {
    struct Official {
        string name;
        uint8 badgeCount;
        bool isActive;
    }

    mapping(address => Official) public officials;
    address public scrollkeeper;
    uint8 public maxBadges = 8;
    uint8 public startingBadges = 5;

    event BadgeAdded(address indexed official, string reason, uint8 totalBadges);
    event BadgeRemoved(address indexed official, string reason, uint8 totalBadges);
    event OfficialRegistered(address indexed official, string name);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may mint or burn");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerOfficial(address _addr, string memory _name) public onlyScrollkeeper {
        officials[_addr] = Official(_name, startingBadges, true);
        emit OfficialRegistered(_addr, _name);
    }

    function addBadge(address _addr, string memory _reason) public onlyScrollkeeper {
        require(officials[_addr].isActive, "Official not active");
        require(officials[_addr].badgeCount < maxBadges, "Already at max badges");
        officials[_addr].badgeCount += 1;
        emit BadgeAdded(_addr, _reason, officials[_addr].badgeCount);
    }

    function removeBadge(address _addr, string memory _reason) public onlyScrollkeeper {
        require(officials[_addr].isActive, "Official not active");
        require(officials[_addr].badgeCount > 0, "No badges to remove");
        officials[_addr].badgeCount -= 1;
        emit BadgeRemoved(_addr, _reason, officials[_addr].badgeCount);
    }

    function getBadgeCount(address _addr) public view returns (uint8) {
        return officials[_addr].badgeCount;
    }

    function isStillActive(address _addr) public view returns (bool) {
        return officials[_addr].isActive;
    }
}

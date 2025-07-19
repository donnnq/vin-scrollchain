// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollDeployBadge - VINVIN-style deployment tracker with badge minting
/// @author VINVIN
/// @notice Mints completion badges upon successful mission test + log confirmation

contract ScrollDeployBadge {
    address public scrollMaster;
    uint256 public badgeCount;

    struct Mission {
        string label;
        address deployer;
        bool completed;
        uint256 timestamp;
    }

    mapping(uint256 => Mission) public missions;
    mapping(address => uint256[]) public userBadges;

    event MissionLogged(address indexed deployer, uint256 indexed badgeId, string label);

    modifier onlyMaster() {
        require(msg.sender == scrollMaster, "Access denied");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function logMission(string memory _label) external {
        missions[badgeCount] = Mission(_label, msg.sender, true, block.timestamp);
        userBadges[msg.sender].push(badgeCount);
        emit MissionLogged(msg.sender, badgeCount, _label);
        badgeCount++;
    }

    function getBadgeHistory(address _user) external view returns (uint256[] memory) {
        return userBadges[_user];
    }

    function getMissionDetails(uint256 _badgeId) external view returns (string memory label, bool completed, uint256 timestamp) {
        Mission memory m = missions[_badgeId];
        return (m.label, m.completed, m.timestamp);
    }

    function updateScrollMaster(address _newMaster) external onlyMaster {
        scrollMaster = _newMaster;
    }
}

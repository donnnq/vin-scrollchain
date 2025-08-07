// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicStrikeChallenge {
    struct Official {
        string name;
        uint256 strikeCount;
        bool isActive;
    }

    mapping(address => Official) public officials;
    address public scrollkeeper;
    uint256 public maxStrikes = 5;

    event StrikeAdded(address indexed official, string reason, uint256 totalStrikes);
    event StrikeRemoved(address indexed official, string redemption, uint256 totalStrikes);
    event LicenseRevoked(address indexed official, string name);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may judge");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerOfficial(address _addr, string memory _name) public onlyScrollkeeper {
        officials[_addr] = Official(_name, 0, true);
    }

    function addStrike(address _addr, string memory _reason) public onlyScrollkeeper {
        require(officials[_addr].isActive, "Official not active");
        officials[_addr].strikeCount += 1;
        emit StrikeAdded(_addr, _reason, officials[_addr].strikeCount);

        if (officials[_addr].strikeCount >= maxStrikes) {
            officials[_addr].isActive = false;
            emit LicenseRevoked(_addr, officials[_addr].name);
        }
    }

    function redeemStrike(address _addr, string memory _redemption) public onlyScrollkeeper {
        require(officials[_addr].isActive, "Official not active");
        require(officials[_addr].strikeCount > 0, "No strikes to redeem");
        officials[_addr].strikeCount -= 1;
        emit StrikeRemoved(_addr, _redemption, officials[_addr].strikeCount);
    }

    function getStrikeCount(address _addr) public view returns (uint256) {
        return officials[_addr].strikeCount;
    }

    function isStillLicensed(address _addr) public view returns (bool) {
        return officials[_addr].isActive;
    }
}

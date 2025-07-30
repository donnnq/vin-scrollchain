// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinGambleBan.sol
/// @notice Bans online gambling platforms and logs violations for civic enforcement.

contract vinGambleBan {
    address public enforcer;

    struct BanEntry {
        string platformName;
        string reason;
        address reportedBy;
        uint timestamp;
    }

    BanEntry[] public bans;

    event PlatformBanned(string platformName, string reason);

    constructor() {
        enforcer = msg.sender;
    }

    modifier onlyEnforcer() {
        require(msg.sender == enforcer, "Not authorized");
        _;
    }

    function banPlatform(string memory platformName, string memory reason) public onlyEnforcer {
        bans.push(BanEntry(platformName, reason, msg.sender, block.timestamp));
        emit PlatformBanned(platformName, reason);
    }

    function getBan(uint index) public view returns (BanEntry memory) {
        require(index < bans.length, "Invalid index");
        return bans[index];
    }

    function totalBans() public view returns (uint) {
        return bans.length;
    }
}

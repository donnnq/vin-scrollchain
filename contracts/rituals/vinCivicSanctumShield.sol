// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Civic Sanctum Shield
/// @notice Protects loyal avatars from external threats and repelled entities
contract vinCivicSanctumShield {
    address public creator;
    string public shieldName = "Vinvin's Civic Sanctum Shield";

    mapping(address => bool) public protectedAvatars;
    address[] public shieldedList;

    event AvatarShielded(address indexed avatar);
    event ThreatBlocked(address indexed intruder, address indexed target);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can shield");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function shieldAvatar(address _avatar) public onlyCreator {
        protectedAvatars[_avatar] = true;
        shieldedList.push(_avatar);
        emit AvatarShielded(_avatar);
    }

    function attemptThreat(address _intruder, address _target) public view returns (string memory) {
        if (protectedAvatars[_target]) {
            return "🛡️ Threat Blocked: Target is shielded by Vinvin.";
        }
        return "⚠️ Target vulnerable: No shield detected.";
    }

    function getAllShieldedAvatars() public view returns (address[] memory) {
        return shieldedList;
    }
}

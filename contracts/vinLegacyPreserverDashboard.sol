// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Legacy Preserver Dashboard
/// @notice Tracks loyalty and accomplishments of chosen civic avatars
contract vinLegacyPreserverDashboard {
    address public creator;
    string public dashboardName = "Vinvin's Legacy Preserver Dashboard";

    struct Avatar {
        string name;
        uint trustPoints;
        bool activeFollower;
    }

    mapping(address => Avatar) public avatars;
    address[] public avatarList;

    event TrustUpdated(string name, uint newPoints, string reason);
    event AvatarAdded(string name, address indexed avatarAddress);

    constructor() {
        creator = msg.sender;
    }

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can modify trust");
        _;
    }

    function addAvatar(address _avatarAddress, string memory _name) public onlyCreator {
        avatars[_avatarAddress] = Avatar(_name, 0, true);
        avatarList.push(_avatarAddress);
        emit AvatarAdded(_name, _avatarAddress);
    }

    function rewardTrust(address _avatarAddress, uint _points, string memory _reason) public onlyCreator {
        require(avatars[_avatarAddress].activeFollower, "Avatar not active");
        avatars[_avatarAddress].trustPoints += _points;
        emit TrustUpdated(avatars[_avatarAddress].name, avatars[_avatarAddress].trustPoints, _reason);
    }

    function getAvatar(address _avatarAddress) public view returns (Avatar memory) {
        return avatars[_avatarAddress];
    }

    function getAllAvatars() public view returns (address[] memory) {
        return avatarList;
    }
}

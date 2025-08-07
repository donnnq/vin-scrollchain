// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Auto Delegation Protocol
/// @notice Grants execution rights to avatars who reach trust threshold
contract vinAutoDelegationProtocol {
    address public creator;
    uint public trustThreshold = 100;

    struct Avatar {
        string name;
        uint trustPoints;
        bool canExecute;
    }

    mapping(address => Avatar) public avatars;
    address[] public avatarList;

    event AvatarDelegated(string name, address indexed avatarAddress);
    event TrustUpdated(string name, uint newPoints, string reason);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can modify");
        _;
    }

    modifier onlyDelegated() {
        require(avatars[msg.sender].canExecute, "Not authorized to execute");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function addAvatar(address _avatarAddress, string memory _name) public onlyCreator {
        avatars[_avatarAddress] = Avatar(_name, 0, false);
        avatarList.push(_avatarAddress);
    }

    function rewardTrust(address _avatarAddress, uint _points, string memory _reason) public onlyCreator {
        Avatar storage avatar = avatars[_avatarAddress];
        avatar.trustPoints += _points;
        emit TrustUpdated(avatar.name, avatar.trustPoints, _reason);

        if (avatar.trustPoints >= trustThreshold && !avatar.canExecute) {
            avatar.canExecute = true;
            emit AvatarDelegated(avatar.name, _avatarAddress);
        }
    }

    function executeLegacyAction(string memory _action) public onlyDelegated returns (string memory) {
        // Symbolic execution placeholder
        return string(abi.encodePacked("Avatar ", avatars[msg.sender].name, " executed: ", _action));
    }

    function getAvatar(address _avatarAddress) public view returns (Avatar memory) {
        return avatars[_avatarAddress];
    }

    function getAllAvatars() public view returns (address[] memory) {
        return avatarList;
    }
}

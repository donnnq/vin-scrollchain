// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Avatar Sanctum Manifest
/// @notice Registry of loyal avatars with sigil lineage and civic roles
contract vinAvatarSanctumManifest {
    address public creator;
    string public manifestName = "Vinvin's Avatar Sanctum Manifest";

    struct Avatar {
        string name;
        string sigil;
        string civicRole;
        uint inductedAt;
    }

    mapping(address => Avatar) public avatars;
    address[] public manifestList;

    event AvatarInducted(string name, string sigil, string civicRole, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can induct avatars");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function inductAvatar(address _avatar, string memory _name, string memory _sigil, string memory _civicRole) public onlyCreator {
        avatars[_avatar] = Avatar(_name, _sigil, _civicRole, block.timestamp);
        manifestList.push(_avatar);
        emit AvatarInducted(_name, _sigil, _civicRole, block.timestamp);
    }

    function getAvatar(address _avatar) public view returns (Avatar memory) {
        return avatars[_avatar];
    }

    function getAllAvatars() public view returns (address[] memory) {
        return manifestList;
    }
}

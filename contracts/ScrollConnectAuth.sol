// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollConnectAuth {
    struct UserProfile {
        string username;
        string avatar;
        bool connected;
    }

    mapping(address => UserProfile) public profiles;

    event WalletConnected(address indexed user, string username);
    event AvatarUpdated(address indexed user, string avatar);

    function connectWallet(string calldata username) external {
        profiles[msg.sender] = UserProfile(username, "", true);
        emit WalletConnected(msg.sender, username);
    }

    function updateAvatar(string calldata avatar) external {
        require(profiles[msg.sender].connected, "Not connected");
        profiles[msg.sender].avatar = avatar;
        emit AvatarUpdated(msg.sender, avatar);
    }

    function getProfile(address user) external view returns (
        string memory username,
        string memory avatar,
        bool connected
    ) {
        UserProfile memory p = profiles[user];
        return (p.username, p.avatar, p.connected);
    }
}

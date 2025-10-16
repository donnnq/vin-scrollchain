// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversalTouchscreenControlPack {
    address public admin;

    struct ControlScheme {
        string gameTitle;
        string layoutType;
        string emotionalTag;
        bool deployed;
    }

    ControlScheme[] public schemes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitScheme(string memory gameTitle, string memory layoutType, string memory emotionalTag) external onlyAdmin {
        schemes.push(ControlScheme(gameTitle, layoutType, emotionalTag, false));
    }

    function deployScheme(uint256 index) external onlyAdmin {
        schemes[index].deployed = true;
    }

    function getScheme(uint256 index) external view returns (ControlScheme memory) {
        return schemes[index];
    }
}

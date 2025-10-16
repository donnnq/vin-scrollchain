// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TouchscreenControlCodexDAO {
    address public admin;

    struct ControlEntry {
        string gameTitle;
        string controlScheme;
        string emotionalTag;
        bool optimized;
    }

    ControlEntry[] public controls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory gameTitle, string memory controlScheme, string memory emotionalTag) external onlyAdmin {
        controls.push(ControlEntry(gameTitle, controlScheme, emotionalTag, false));
    }

    function optimizeEntry(uint256 index) external onlyAdmin {
        controls[index].optimized = true;
    }

    function getEntry(uint256 index) external view returns (ControlEntry memory) {
        return controls[index];
    }
}

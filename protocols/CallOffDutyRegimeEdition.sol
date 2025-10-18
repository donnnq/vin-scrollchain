// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallOffDutyRegimeEdition {
    address public admin;

    struct Operative {
        string codename;
        string origin;
        string mission;
        string emotionalTag;
        bool deployed;
        bool survived;
    }

    Operative[] public operatives;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployOperative(string memory codename, string memory origin, string memory mission, string memory emotionalTag) external onlyAdmin {
        operatives.push(Operative(codename, origin, mission, emotionalTag, true, false));
    }

    function markSurvival(uint256 index) external onlyAdmin {
        operatives[index].survived = true;
    }

    function getOperative(uint256 index) external view returns (Operative memory) {
        return operatives[index];
    }
}

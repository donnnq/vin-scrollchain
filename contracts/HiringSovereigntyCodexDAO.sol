// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HiringSovereigntyCodexDAO {
    address public admin;

    struct HiringPrinciple {
        string agency;
        string principle;
        string enforcementProtocol;
        bool ratified;
    }

    HiringPrinciple[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPrinciple(string memory _agency, string memory _principle, string memory _enforcementProtocol) external onlyAdmin {
        codex.push(HiringPrinciple(_agency, _principle, _enforcementProtocol, false));
    }

    function ratifyPrinciple(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getPrinciple(uint256 index) external view returns (HiringPrinciple memory) {
        return codex[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PromptInjectionAuditCodexDAO {
    address public admin;

    struct InjectionCase {
        string entryPoint;
        string payloadType;
        string consequence;
        string emotionalTag;
        bool patched;
    }

    InjectionCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logCase(string memory _entryPoint, string memory _payloadType, string memory _consequence, string memory _emotionalTag) external onlyAdmin {
        cases.push(InjectionCase(_entryPoint, _payloadType, _consequence, _emotionalTag, false));
    }

    function markPatched(uint256 index) external onlyAdmin {
        cases[index].patched = true;
    }

    function getCase(uint256 index) external view returns (InjectionCase memory) {
        return cases[index];
    }
}

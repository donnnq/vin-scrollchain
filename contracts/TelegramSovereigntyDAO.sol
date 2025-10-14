// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelegramSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string jurisdiction;
        string platformPolicy;
        string sovereigntyClause;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _jurisdiction, string memory _platformPolicy, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(SovereigntyEntry(_jurisdiction, _platformPolicy, _sovereigntyClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        registry[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return registry[index];
    }
}

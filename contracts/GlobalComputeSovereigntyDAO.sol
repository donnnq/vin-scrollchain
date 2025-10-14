// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalComputeSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string region;
        string computeResource;
        string sovereigntyPolicy;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPolicy(string memory _region, string memory _computeResource, string memory _sovereigntyPolicy, string memory _emotionalTag) external onlyAdmin {
        protocols.push(SovereigntyEntry(_region, _computeResource, _sovereigntyPolicy, _emotionalTag, false));
    }

    function ratifyPolicy(uint256 index) external onlyAdmin {
        protocols[index].ratified = true;
    }

    function getPolicy(uint256 index) external view returns (SovereigntyEntry memory) {
        return protocols[index];
    }
}

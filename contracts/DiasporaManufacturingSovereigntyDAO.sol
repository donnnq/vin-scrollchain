// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaManufacturingSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string diasporaRegion;
        string manufacturingProtocol;
        string emotionalTag;
        bool activated;
    }

    SovereigntyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _diasporaRegion, string memory _manufacturingProtocol, string memory _emotionalTag) external onlyAdmin {
        protocols.push(SovereigntyEntry(_diasporaRegion, _manufacturingProtocol, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (SovereigntyEntry memory) {
        return protocols[index];
    }
}

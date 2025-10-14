// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRDProtocolDAO {
    address public admin;

    struct RDEntry {
        string barangay;
        string researchFocus;
        string developmentGoal;
        string emotionalTag;
        bool deployed;
    }

    RDEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _barangay, string memory _researchFocus, string memory _developmentGoal, string memory _emotionalTag) external onlyAdmin {
        protocols.push(RDEntry(_barangay, _researchFocus, _developmentGoal, _emotionalTag, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (RDEntry memory) {
        return protocols[index];
    }
}

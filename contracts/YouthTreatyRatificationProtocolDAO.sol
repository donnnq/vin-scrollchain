// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthTreatyRatificationProtocolDAO {
    address public admin;

    struct TreatyEntry {
        string purokOrBarangay;
        string treatyFocus;
        string ratificationClause;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _purokOrBarangay, string memory _treatyFocus, string memory _ratificationClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(TreatyEntry(_purokOrBarangay, _treatyFocus, _ratificationClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        protocols[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return protocols[index];
    }
}

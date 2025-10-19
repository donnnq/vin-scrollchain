// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureKarmaDAO {
    address public admin;

    struct KarmaEntry {
        string projectName;
        string location;
        string failureType;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory projectName, string memory location, string memory failureType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(projectName, location, failureType, emotionalTag, true, false, false));
    }

    function confirmDocumentation(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}

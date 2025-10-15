// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTrustRestorationDAO {
    address public admin;

    struct RestorationEntry {
        string institution;
        string trustClause;
        string emotionalTag;
        bool activated;
    }

    RestorationEntry[] public restoration;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRestoration(string memory _institution, string memory _trustClause, string memory _emotionalTag) external onlyAdmin {
        restoration.push(RestorationEntry(_institution, _trustClause, _emotionalTag, false));
    }

    function activateRestoration(uint256 index) external onlyAdmin {
        restoration[index].activated = true;
    }

    function getRestoration(uint256 index) external view returns (RestorationEntry memory) {
        return restoration[index];
    }
}

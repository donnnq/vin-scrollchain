// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToMedicineAccessExpansionGrid {
    string public batchID = "1321.9.219";
    string public steward = "Vinvin";

    address public admin;

    struct Medicine {
        string name;        // antibiotics, vaccines, insulin
        string status;      // accessible, pending, ghost
        uint256 timestamp;
    }

    Medicine[] public medicines;

    event MedicineLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMedicine(string memory name, string memory status) public onlyAdmin {
        medicines.push(Medicine(name, status, block.timestamp));
        emit MedicineLogged(name, status);
    }

    function getMedicine(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Medicine memory m = medicines[index];
        return (m.name, m.status, m.timestamp);
    }
}

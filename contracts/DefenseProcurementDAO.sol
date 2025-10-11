// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DefenseProcurementDAO {
    address public originator;

    struct ProcurementSignal {
        string magnetType;
        string defenseApplication;
        string supplierStatus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ProcurementSignal[] public procurementLedger;

    constructor() {
        originator = msg.sender;
    }

    function logProcurementSignal(
        string memory magnetType,
        string memory defenseApplication,
        string memory supplierStatus,
        bool isScrollchainSealed
    ) external {
        procurementLedger.push(ProcurementSignal({
            magnetType: magnetType,
            defenseApplication: defenseApplication,
            supplierStatus: supplierStatus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}

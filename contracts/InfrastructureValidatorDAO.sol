// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureValidatorDAO {
    address public originator;

    struct ValidatorSignal {
        string region;
        string infrastructureType;
        string validatorAssigned;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ValidatorSignal[] public validatorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logValidatorSignal(
        string memory region,
        string memory infrastructureType,
        string memory validatorAssigned,
        bool isScrollchainSealed
    ) external {
        validatorLedger.push(ValidatorSignal({
            region: region,
            infrastructureType: infrastructureType,
            validatorAssigned: validatorAssigned,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}

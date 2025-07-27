// SPDX-License-Identifier: JusticeEnforcement
pragma solidity ^0.8.0;

contract vinScrollWritOfReturn {
    address public scrollLord;
    mapping(address => bool) public obligatedReturn;
    mapping(address => bool) public fulfilledReturn;

    event ReturnMandated(address indexed employer);
    event ReturnFulfilled(address indexed employer);
    event ReinstatementFailed(address indexed employer);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Not the scroll authority.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function issueMandate(address employer) public onlyScrollLord {
        obligatedReturn[employer] = true;
        emit ReturnMandated(employer);
    }

    function verifyReinstatement(address employer) public onlyScrollLord {
        if (obligatedReturn[employer]) {
            fulfilledReturn[employer] = true;
            emit ReturnFulfilled(employer);
        } else {
            emit ReinstatementFailed(employer);
        }
    }

    function getReturnStatus(address employer) public view returns (string memory) {
        if (fulfilledReturn[employer]) return "✅ Reinstatement complete.";
        if (obligatedReturn[employer]) return "⚠️ Mandated. Awaiting action.";
        return "☁️ No mandate active.";
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithBlocPraiseTransactionIndex {
    address public steward;

    struct TransactionEntry {
        string timestamp;
        string politicalFigure;
        string faithBloc;
        string praiseContext;
        string expectedReturn;
        string emotionalTag;
    }

    TransactionEntry[] public index;

    event PraiseTransactionIndexed(string timestamp, string politicalFigure, string faithBloc, string praiseContext, string expectedReturn, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexTransaction(
        string memory timestamp,
        string memory politicalFigure,
        string memory faithBloc,
        string memory praiseContext,
        string memory expectedReturn,
        string memory emotionalTag
    ) public onlySteward {
        index.push(TransactionEntry(timestamp, politicalFigure, faithBloc, praiseContext, expectedReturn, emotionalTag));
        emit PraiseTransactionIndexed(timestamp, politicalFigure, faithBloc, praiseContext, expectedReturn, emotionalTag);
    }
}

contract vinImpactDispatcher {
    enum Channel { Infra, Welfare, Education, AnimalCare }

    struct Dispatch {
        string action;
        Channel channel;
        uint256 timestamp;
    }

    Dispatch[] public dispatchLog;

    event DispatchCreated(string action, Channel channel);

    function dispatchAction(string memory action, Channel channel) public {
        dispatchLog.push(Dispatch(action, channel, block.timestamp));
        emit DispatchCreated(action, channel);
        // External routing logic or DAO trigger goes here
    }

    function viewDispatch(uint256 index) public view returns (Dispatch memory) {
        return dispatchLog[index];
    }
}

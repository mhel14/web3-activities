// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ActionLogsEventHandler {
    mapping(address => string) public ActionLogs;
    event ActionPerformed(address user, string action);

    function logAction(string memory _action) external {
        ActionLogs[msg.sender] = _action;
        emit ActionPerformed(msg.sender, _action);
    }
}

contract VoteLogsEventHandler {
    struct Vote {
        uint proposalId;
        bool choice;
    }
    mapping(address => Vote) public votes;

    event VoteCasted(address indexed voter, uint proposalId, bool choice);

    function vote(uint _proposalId, bool _choice) public {
        votes[msg.sender] = Vote({proposalId: _proposalId, choice: _choice});
        emit VoteCasted(msg.sender, _proposalId, _choice);
    }
}

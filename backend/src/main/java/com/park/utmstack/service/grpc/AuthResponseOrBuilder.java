// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: agent.proto

package com.park.utmstack.service.grpc;

public interface AuthResponseOrBuilder extends
    // @@protoc_insertion_point(interface_extends:agent.AuthResponse)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <code>uint64 agent_id = 1;</code>
   * @return The agentId.
   */
  long getAgentId();

  /**
   * <code>string agent_key = 2;</code>
   * @return The agentKey.
   */
  java.lang.String getAgentKey();
  /**
   * <code>string agent_key = 2;</code>
   * @return The bytes for agentKey.
   */
  com.google.protobuf.ByteString
      getAgentKeyBytes();
}
